pacman::p_load(
  magick,
  reshape2,
  dplyr,
  tidygraph,
  particles,
  animation
)

plot_fun <- function(sim) {
  df <- as_tibble(sim)
  plot(df$x, df$y, col = df$color, pch = '.', axes = FALSE, xlim = c(-100, 317), ylim = c(-268, 100), xlab = NA, ylab = NA)
}

logo <- image_read('https://www.r-project.org/logo/Rlogo.png') %>%
  image_scale('30%')

logo_frame <- melt(as.matrix(as.raster(logo)), c('y', 'x'), value.name = 'color', as.is = TRUE) %>%
  filter(color != 'transparent') %>%
  mutate(color = as.character(color),
         y = -y,
         batch = as.integer(cut(-x + rnorm(n(), 0, 10), 50)),
         include = FALSE,
         y_drift = rnorm(n(), 300, 70),
         x_drift = rnorm(n(), 300, 90))

saveGIF(
  tbl_graph(logo_frame) %>%
    simulate(alpha_decay = 0, setup = predefined_genesis(x, y)) %>%
    wield(y_force, y = y_drift, include = include, strength = 0.02) %>%
    wield(x_force, x = x_drift, include = include, strength = 0.02) %>%
    wield(random_force, xmin = -.1, xmax = .1, ymin = -.1, ymax = .1, include = include) %>%
    evolve(120, function(sim) {
      sim <- record(sim)
      sim <- mutate(sim, include = batch < evolutions(sim) - 10)
      plot_fun(sim)
      sim
    }),
  movie.name = 'r_logo.gif',
  interval = 1/24, ani.width = 500, ani.height = 400
)
