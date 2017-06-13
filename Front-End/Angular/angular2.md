

```
npm install @angular/common @angular/compiler @angular/core @angular/forms @angular/http @angular/platform-browser @angular/platform-browser-dynamic  @angular/router --save



npm install angular2-template-loader awesome-typescript-loader css-loader file-loader html-loader null-loader raw-loader style-loader to-string-loader --save-dev



npm install html-webpack-plugin webpack-merge extract-text-webpack-plugin --save-dev



npm install rimraf --save-dev



node_modules\.bin\typings install dt~core-js --save --global
node_modules\.bin\typings install dt~node --save --global
```


```
npm install bootstrap-sass ng2-bootstrap --save
```


```javascript
@Component({
  selector: 'hero-details',
  template: `
    <h2>{{hero.name}}</h2>
    <hero-team [hero]=hero></hero-team>
    <ng-content></ng-content>
  `,
  styleUrls: ['app/hero-details.component.css']
})


@Component({
  selector: 'hero-details',
  template: `
    <h2>{{hero.name}}</h2>
    <hero-team [hero]=hero></hero-team>
    <ng-content></ng-content>
  `,
  styles: [
    require('./app.style.less').toString()
  ]
})
```
