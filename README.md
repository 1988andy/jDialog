	
	
	 _______                   __                __    __              __     
	/       \                 /  |              /  \  /  |            /  |  
	$$$$$$$  | _______    ____$$ | __    __     $$  \ $$ |  ______   _$$ |_   
	$$ |__$$ |/       \  /    $$ |/  |  /  |    $$$  \$$ | /      \ / $$   |
	$$    $$< $$$$$$$  |/$$$$$$$ |$$ |  $$ |    $$$$  $$ |/$$$$$$  |$$$$$$/   
	$$$$$$$  |$$ |  $$ |$$ |  $$ |$$ |  $$ |    $$ $$ $$ |$$    $$ |  $$ | __ 
	$$ |__$$ |$$ |  $$ |$$ \__$$ |$$ \__$$ | __ $$ |$$$$ |$$$$$$$$/   $$ |/  | 
	$$    $$/ $$ |  $$ |$$    $$ |$$    $$ |/  |$$ | $$$ |$$       |  $$  $$/ 
	$$$$$$$/  $$/   $$/  $$$$$$$/  $$$$$$$ |$$/ $$/   $$/  $$$$$$$/    $$$$/  
	                              /  \__$$ |                                  
	                              $$    $$/                                   
	                               $$$$$$/                                    
	
 
# [jDialog](https://github.com/bndynet/jdialog)

A javascript framework for developing pretty browser dialogs and notifications. 

[Demo](http://bndy.net/jDialog/demo/)

## Dependencies

Requires:
 - jQuery
 - [layer](https://github.com/sentsin/layer)
 - [alertifyjs](https://github.com/alertifyjs/alertify.js)

## Quick start

- Clone the repo

    `git clone https://github.com/bndynet/jdialog.git`


### What's included

Within the download you'll find the following directories and files, logically grouping common assets and providing both compiled and minified variations. You'll see something like this:

```
jDialog/
├── dist/
│   ├── jdialog.css
│   ├── jdialog.min.css
│   ├── jdialog.js
│   └── jdialog.min.js
├── demo/
└── src/
    ├── jdialog.scss
    └── jdialog.coffee
```

We provide compiled CSS and JS (`jdialog.*`), as well as compiled and minified CSS and JS (`jdialog.min.*`). 


### Usage

```html
<!-- Latest compiled and minified CSS -->
<link href="dist/jdialog.min.css" rel="stylesheet"/>
<!-- Latest compiled and minified JavaScript -->
<script src="dist/jdialog.min.js"></script>
```

```js
dialog.set(options);

dialog.info(msg, callback, options);
dialog.error(msg, callback, options);
dialog.success(msg, callback, options);

dialog.alert(msg, callback, options);
dialog.confirm(msg, fnYes, fnCancel, options);
dialog.prompt(title, fnYes, formType);

dialog.tip(msg, selector, options);
dialog.show(selector, title, size);     //size: [600, 460], ["50%", "50%"]
dialog.iframe(url, title, size, fnClose); //fnClose: function(dialogResult)
dialog.loading(selector, options);
dialog.loaded(selector, selectorContent);   //selectorContent: e.g. "No Data" 
dialog.close(dialogResult);
dialog.closeAll(dialogResult);
```

#### options

Default Options
```json
title: "jDialog v2",
shade: [0.2, "#000"],
shadeClose: false,
shift: 0,
maxmin: true,
fix: true,
btn: ["OK", "Cancel"],
closeBtn: 1,
tips: [1, '#f0ad4e'],
tipsTime: 3000,
loadingIcon: 1,
loadingShade: [0.6, "#fff"],
useAlertify: true,
wait: 2,        //seconds
logPosition: "bottom right",
closeLogOnClick: false
```


## Copyright and license



Code and documentation (c) 2016 [Bndy.Net](http://www.bndy.net). Code released under the MIT License. 
