---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://rubberduckvba.wordpress.com/2023/04/11/lightweight-mvvm-in-vba/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Lightweight MVVM in VBA", "Lightweight MVVM in VBA"]
---
# Lightweight MVVM in VBA

## Metadata
- Author: [[Rubberduck VBA]]
- Full Title: Lightweight MVVM in VBA
- Category: #Type/Highlight/Article
- URL: https://rubberduckvba.wordpress.com/2023/04/11/lightweight-mvvm-in-vba/

## Highlights
- A little while ago already, I went and explored dynamic UI with MSForms in VBA through a lens tinted with Windows Presentation Foundation (WPF) concepts, and ended up implementing a working prototype Model-View-ViewModel (MVVM) framework for VBA… across a hundred and some modules covering everything from property and command bindings to input and model validation
- Bindings and the propagation of property value changes are the core mechanics that make MVVM work, and we don’t need dozens of classes for that.
  We do need INotifyPropertyChanged and IHandlePropertyChanged interfaces:
- These interfaces are important, because the bindings need to handle property changed events; the View Model needs to invoke the registered callbacks. This is used in place of actual events, because interfaces in VBA don’t expose events, and we want an abstraction around property changes, so that everything that needs to notify about property changes can do so in a standardized way.
