'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "6634483e46330d6a2fcd8a9d92a26248",
"assets/assets/fonts/HelveticaNowText-Black.otf": "4ba10bc92e7f6199017494aef90c277a",
"assets/assets/fonts/HelveticaNowText-Bold.otf": "c53f2f345f5b3f04856a13f443e37a83",
"assets/assets/fonts/HelveticaNowText-Light.otf": "226a5339226468347958e624e05d5be2",
"assets/assets/fonts/HelveticaNowText-Medium.otf": "304b61507dce3b3dd5de216f7bc4c90a",
"assets/assets/fonts/HelveticaNowText-RegIta.otf": "0f7639ad25cf45b95e8443ed81173388",
"assets/assets/fonts/HelveticaNowText-Regular.otf": "9ef98f6b4ed260ed5c4c009503bc13ee",
"assets/assets/icons/archivo.png": "c295e7b18b5b3d1d18b09ff45f6a1c4f",
"assets/assets/icons/CriteriosCOVID_1.png": "a66dda6b40e3c3f9884774a3834c47e4",
"assets/assets/icons/CriteriosCOVID_2.png": "2d5aa181fb9b0b6a4c71d248de455c7d",
"assets/assets/icons/CriteriosCOVID_3.png": "3e10beef0e9cd520c395e6e609c5fe57",
"assets/assets/icons/CriteriosCOVID_4.png": "f3d7ed33507e6b69561ce5e59d2cabed",
"assets/assets/icons/CriteriosCOVID_5.png": "afa3832522be85ef3b00661b251b3892",
"assets/assets/icons/CriteriosCOVID_6.png": "7e69698aaf6d2d7ff09155003c0b35a5",
"assets/assets/icons/CriteriosCOVID_7.png": "a66dda6b40e3c3f9884774a3834c47e4",
"assets/assets/icons/CriteriosCOVID_8.png": "acc9aac34b727f1f7a8aff3490178da9",
"assets/assets/icons/CriteriosCOVID_9.png": "4b4fc412d7d4f86f314b17e8a81b7ebb",
"assets/assets/icons/icn_acceso.png": "9543951790c009cca0ef0031020f005f",
"assets/assets/icons/icn_aula.png": "ce09447826e11290cdd38aa99d0e77af",
"assets/assets/icons/icn_curp.png": "bc771cf9f2c579884153feac9bf04d1e",
"assets/assets/icons/icn_envio.png": "10457232121ec666ba07aa5a8a49d1fa",
"assets/assets/icons/icn_estatus.png": "cacb74e3f67e7e333dfa8e14f39ee3dd",
"assets/assets/icons/icn_folio.png": "421615b40b79617e453c78f0227590da",
"assets/assets/icons/icn_guardar.png": "bfcb3c817556a07cb52810525558180b",
"assets/assets/icons/icn_observaciones.png": "89b6ab0a926a5c5674b9cc71133f6ff4",
"assets/assets/icons/icn_proceso.png": "1bab92ebe9865899733784b2aee47ed2",
"assets/assets/icons/icn_recibo.png": "8804352e6ef82966ff16c0ea300022cd",
"assets/assets/icons/icn_reimpresion.png": "14e33632fcc19cc888350bab08937256",
"assets/assets/icons/icn_usuario.png": "b94d583a6b1266a14c43012164ebee14",
"assets/assets/images/archivo.png": "c295e7b18b5b3d1d18b09ff45f6a1c4f",
"assets/assets/images/banner_consulta.png": "a41eac78066b1993b7ea984421b6d9c9",
"assets/assets/images/btn_descarga.png": "ae8384233b8958bad1696f6b7a183836",
"assets/assets/images/cel_comenzar.png": "2e3fb8292b7e3df9af52634ebac8226a",
"assets/assets/images/cel_solicitud.png": "725ff6e4dd7bd68a0da52e472efea15f",
"assets/assets/images/credencial.png": "f19005f89fbf6a5bcae1be94155e4eea",
"assets/assets/images/Credencial_responsable.png": "0950cb9525cf3934c6c6f598ffff52ed",
"assets/assets/images/eslogan.png": "691124ff9e715d931b894115d9cc4fcb",
"assets/assets/images/firma.png": "3a54f10900d0cb3528dfc7b1cb4fc6a6",
"assets/assets/images/fondo_inscripciones.jpg": "f9a9100d650d1f2a1a808c77f21e6fbc",
"assets/assets/images/listones.png": "db6de610c1df77b8b2ef4233755bdeec",
"assets/assets/images/logos_cco_nuevos.png": "40058c28c61c025cf282f804a88dae10",
"assets/assets/images/logo_cco.png": "bbae1000b9c4673cde02f252bd81cc3f",
"assets/assets/images/pc_comenzar.png": "2e54d7616ac8068aae42b79dffd8e54c",
"assets/assets/images/pc_solicitud.png": "0d051d0cb0f00f719364ef54b3d9e8b9",
"assets/assets/images/splash.png": "4276b31acbb95b73b1b71b5cff8159a9",
"assets/assets/logos/LogoHorizontal_CCO.png": "dc883019783071100cc047f9b91b5da4",
"assets/assets/logos/LogotipoMIDO.png": "ac357f784106db53f8263cb685923fbb",
"assets/assets/logos/logo_alternativos.png": "aa12b3362890326765d08fbe280a8319",
"assets/assets/logos/logo_artesplasticas.png": "4c1194ffa8ecaa3cc82cf0bf9b313156",
"assets/assets/logos/logo_cambio.png": "d3393acb1f28b228dd807973004d90f4",
"assets/assets/logos/logo_cambio_2.png": "7b117ebe135f234cc046cedce8b375a2",
"assets/assets/logos/Logo_cco.gif": "841d7a91b337b1f1eb62e5f8a4c0cfe4",
"assets/assets/logos/Logo_cco_2a.gif": "300a7eb4987cbd4c815499dcedd3a7c9",
"assets/assets/logos/logo_culturainfantil.png": "6655d4b1091457f11343529d9186fd60",
"assets/assets/logos/logo_danza.png": "c92481a8720b4d3bf2d623fef64f55d8",
"assets/assets/logos/Logo_gob2023.png": "2aa3959e696d9942d1ff5455149173f6",
"assets/assets/logos/logo_musica.png": "b7aef1ad9075e6af53c04a6b5da0100c",
"assets/assets/logos/logo_teatro.png": "e847c19b5bf82c01576e2e50783614e8",
"assets/assets/logos/pleca_gob_CCO.png": "66bb879eb5dd222c4fc708a1c75cda56",
"assets/assets/svg/apple_podcast.svg": "a643182ed124c9a15fb1c541f3ddf44d",
"assets/assets/svg/btn_aprobacion.svg": "074f63319f949edd0d119df58090f186",
"assets/assets/svg/btn_descarga.svg": "d8c93cc2dbf59fd1f79a857331a0ba6f",
"assets/assets/svg/cuadros_fondo.svg": "aeefd2b8acf384a25883caa95fba1c14",
"assets/assets/svg/facebook.svg": "87c3860d3149ee3b1f7f71085019e3ce",
"assets/assets/svg/fondo.svg": "71638468d7677062eda22580a7d98290",
"assets/assets/svg/google_podcast.svg": "e4dfa263d3c8241001aa31a03ad87663",
"assets/assets/svg/instagram.svg": "2a8661f04c49fbf305ad28e247ca5e7f",
"assets/assets/svg/logo_cco.svg": "576e639e9c4c5f55a58428b6458ac8bc",
"assets/assets/svg/logo_cco_bco.svg": "0a7fb3546385bfcd4de6b5381a24e411",
"assets/assets/svg/logo_gob.svg": "3ed26baf3261cf4dd401dceb3f6bb3bd",
"assets/assets/svg/logo_gobVeda.svg": "57f80d243f2e82fb0b3750352fd65fea",
"assets/assets/svg/mail.svg": "0630d32ce7840e9d632611461983320f",
"assets/assets/svg/play_podcast_off.svg": "e2bcf959c24c2c969ebe47e158389491",
"assets/assets/svg/play_podcast_on.svg": "7808d5d3ca3c735daf4b5a0e76d5a8bc",
"assets/assets/svg/spotify_podcast.svg": "7028583f22cd620526aebeca42967972",
"assets/assets/svg/telefono.svg": "4cd95639df0d4e3d0b646a17dc604c0b",
"assets/assets/svg/twitter.svg": "efc7f11b5a0f1a6cd36c158f7bc3f1cf",
"assets/assets/svg/youtube.svg": "1be3efda83444ec769bc93fc33b4e1c2",
"assets/FontManifest.json": "9360284b55329e8e1944e51ca07225cf",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "bd52414d25c4662499f11d8cc39c2cb1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/syncfusion_flutter_datagrid/assets/font/FilterIcon.ttf": "c17d858d09fb1c596ef0adbf08872086",
"assets/packages/syncfusion_flutter_datagrid/assets/font/UnsortIcon.ttf": "6d8ab59254a120b76bf53f167e809470",
"assets/packages/youtube_player_iframe/assets/player.html": "dc7a0426386dc6fd0e4187079900aea8",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "95cdcf33012349c106b87d390a08e830",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "79baf6c39c1964d283e71768cb220cf2",
"/": "79baf6c39c1964d283e71768cb220cf2",
"main.dart.js": "31a0132b572e33e0c148eea6e1a730cf",
"manifest.json": "0045c558faf76b37c2f64cb116254986",
"version.json": "9eff8736c75f004a12e4b6c6e413afab"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
