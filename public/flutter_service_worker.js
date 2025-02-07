'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"android-icon-144x144.png": "8c4fc47d7158f9906741c344756a9829",
"android-icon-192x192.png": "e26594bfa62cf044db280993550bb48f",
"android-icon-36x36.png": "172299a499d3e06e3fba8fdd11554362",
"android-icon-48x48.png": "d32c9fcfdffafdf5da9a112441eb4bf8",
"android-icon-72x72.png": "cb3d7bcfaf2cb401da08b17a27c38600",
"android-icon-96x96.png": "e5c7cb1580278c4453d3ef699657c753",
"apple-icon-114x114.png": "34e2ac63ae617b92434627df10b21017",
"apple-icon-120x120.png": "ad92927c53ddef0f39f2723a527e1628",
"apple-icon-144x144.png": "8c4fc47d7158f9906741c344756a9829",
"apple-icon-152x152.png": "9ced90ea06c06e3ba3353f99b9df44e3",
"apple-icon-180x180.png": "d59068d963048170c61ee1a9702f904c",
"apple-icon-57x57.png": "fbfa6c2aeecb98bf3a34b022eca672ed",
"apple-icon-60x60.png": "397ea061142d4d1a4a8bdded24f5569c",
"apple-icon-72x72.png": "cb3d7bcfaf2cb401da08b17a27c38600",
"apple-icon-76x76.png": "b743ae6d8b5d2dff6496bf331f2568af",
"apple-icon-precomposed.png": "c66d50424b394b25b89dbf7dacb70b77",
"apple-icon.png": "c66d50424b394b25b89dbf7dacb70b77",
"assets/animations/Auth_Animation.json": "d57391e7f7e7aa0c8c965871cffc73ae",
"assets/AssetManifest.bin": "80cfc3f268264f412bf59921ecdcb861",
"assets/AssetManifest.bin.json": "bd213faa613d544e573059a2e8d8ad16",
"assets/AssetManifest.json": "e629343000adde6e63a894e36bdf6b34",
"assets/FontManifest.json": "0c213ebcd8f3738f5c68955e1d42464a",
"assets/fonts/MaterialIcons-Regular.otf": "a32060e955224d1ab112fb181c6f2c17",
"assets/fonts/Rochester-Regular.ttf": "4f9b090e2d800aedc4024affe4d85461",
"assets/fonts/RockSalt-Regular.ttf": "9df3e6cb3d6ad2e3e3da76153a325966",
"assets/fonts/Romanesco-Regular.ttf": "04cddd2427b5c7eea5b75007946e5cb8",
"assets/images/apple_logo.png": "27ff1ba5b8de6be08aef31637c445137",
"assets/images/google_logo.png": "1552f823d084b5c4a5fdc3d1cd0de07d",
"assets/images/patreon_logo.png": "40f442f126f11fea34acdb66aa97d120",
"assets/l10n/ar.json": "0920b378dc63d13325218ad492175eee",
"assets/l10n/en.json": "693e4cb3ed7c619199f9141561a4a704",
"assets/l10n/fr.json": "5d988de96a48b80fcc975cee38a85a8f",
"assets/NOTICES": "18e31b440a7f4c421f35500d84d14f97",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "37682cc320ec42ae48e5cb9b36e1df22",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon-16x16.png": "0120ef835756ec05ad8cf8426a34607f",
"favicon-32x32.png": "a180544573a65d70539f046c6a214634",
"favicon-96x96.png": "e5c7cb1580278c4453d3ef699657c753",
"favicon.ico": "d98639c8a9d8e683c9fb1c2d5fba5908",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "c0a4bf1434901531f563e176e6ded689",
"index.html": "97f7516c2d8a6faf932a3643865e2fde",
"/": "97f7516c2d8a6faf932a3643865e2fde",
"main.dart.js": "486cddcf8a1e4edfbc71282e068bf58e",
"manifest.json": "bd24202bf622713a850c6b2350234016",
"ms-icon-144x144.png": "8c4fc47d7158f9906741c344756a9829",
"ms-icon-150x150.png": "ed4db5aed9d40603e2c2695c4aacc15f",
"ms-icon-310x310.png": "1026e51bf99ef085cef072562ef445cb",
"ms-icon-70x70.png": "93adda0e774d0c489b9f7803b8261946",
"version.json": "8e53c1739728d2b1cf4e57950f679f82"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
