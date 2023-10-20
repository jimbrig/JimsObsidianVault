```dataviewjs
const {WeatherGov} = customJS;
let element = this.container.createEl('div', {cls: ["tailwind"]});
await WeatherGov.getWeather(element)
```



```dataviewjs
const {News} = customJS;
let element = this.container.createEl('div', {cls: ["tailwind"]});
await News.listNews(element, 15);
```