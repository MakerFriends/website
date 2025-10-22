# Web Awesome Pro

The zipped folder you have contains the `dist-cdn` (renamed to `/dist` in the zip) of Web Awesome Pro, which is a fully bundled version of Web Awesome that has all the code it needs to run. It is self contained and is not intended to be used with a bundler.

## Usage

Once you've extracted this zip to a location like "webawesome", you can use the pre-bundled directory by setting the basePath of Web Awesome to point to the `/dist` directory of your Web Awesome download. Like so:


```html
<link rel="stylesheet" href="/webawesome/dist/styles/webawesome.css">
<script type="module" src="/webawesome/dist/webawesome.loader.js" data-webawesome="/webawesome/dist"></script>
```


This assumes your Web Awesome directory is accessible at `/webawesome`. Feel free to adjust it to whatever path you saved this zip file to, or wherever it is accessible on your site.

## Why is the unbundled `/dist` not here?

We made the decision not to include the unbundled `/dist` so as not to confuse users. The unbundled version will require you to setup a bundle or importmaps to work properly. We would prefer to encourage people to use `/dist` directly from NPM once we have private registries available.