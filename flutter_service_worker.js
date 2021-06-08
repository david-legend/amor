'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6f3b53ed471a2656846faf046c620ad7",
"main.dart.js": "8aa961fd86f0c3cfbf70b29b0fae95c4",
"index.html": "6b18a66fe2a5543c41ecd8bb7a9b97d3",
"/": "6b18a66fe2a5543c41ecd8bb7a9b97d3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/feather_icons/fonts/feather.ttf": "ad5435302c3c2d1f23f275d0f22d36c6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "14ba276a644f6cc0bcb978cf9e7ff5db",
"assets/NOTICES": "db1996ef4f486e6e0c8caa1f1173bf0b",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/art_4.jpg": "fe30c95c46bba1d23dad414ef7873ec9",
"assets/assets/images/art_2.jpg": "58de6f0ddcacad26bad64e60f2954e64",
"assets/assets/images/art_8.jpg": "833e05ba48a4d079a2d21d6e3929ab30",
"assets/assets/images/ghana_flag.png": "b0afee866ab3333560a0072c5d53bce2",
"assets/assets/images/associate_android_dev.png": "496dc53d08eec0434eeeae9887955ec8",
"assets/assets/images/art_7.jpg": "a39134f3c789d05f759a2087177879e3",
"assets/assets/images/iot_cert.png": "d80c7d2da6319dc50ddeb16c889b7e56",
"assets/assets/images/art_3.jpg": "6de8dd02e6dede2b9d531c211e36dd9b",
"assets/assets/images/art_6.jpg": "701ee47aa8f28811c9c1b0dc50389508",
"assets/assets/images/jade_macy.png": "e70d558bd5d043a556be93884e07e695",
"assets/assets/images/art_5.jpg": "9562261616df4bf40973c1b326d3be20",
"assets/assets/images/art_1.jpg": "2dba92da969582b590c375dc1b4fb5f0",
"assets/assets/images/data_science_cert.png": "1364c23105bfbb8c9197f7ad1f9dd245",
"assets/FontManifest.json": "cab905cb3aac16cd8f8b52a8d504c382",
"icons/apple-icon-60x60.png": "7a31e7f203cf37591e7d61b64b99ff84",
"icons/apple-icon-120x120.png": "3f5cc18acd9c90b457c540e31df1de57",
"icons/apple-icon.png": "0ac49b5f452a0adb68b6c6789b370efa",
"icons/favicon.ico": "65718c86ba90239ccafcaa6f9b04c3dd",
"icons/android-icon-192x192.png": "b298fd9491384dcd04ce520ce23f09b1",
"icons/android-icon-48x48.png": "ced80171b499bf6c9bcd2039447ea9c9",
"icons/android-icon-144x144.png": "0a40ee17a72416dd95ee2dcea8aa1826",
"icons/apple-icon-144x144.png": "0a40ee17a72416dd95ee2dcea8aa1826",
"icons/apple-icon-precomposed.png": "0ac49b5f452a0adb68b6c6789b370efa",
"icons/favicon-16x16.png": "a4c22d49cbee72dfa0cd382aa6026d77",
"icons/favicon-32x32.png": "a8a17fe8ed55005ccb51aa32b32717b4",
"icons/android-icon-36x36.png": "2754b353d94efb727451e44131caa8e2",
"icons/android-icon-72x72.png": "364456feb5b72a65cc0577a19a55e393",
"icons/android-icon-96x96.png": "e13d4f717617d3b425be514b6337bd44",
"icons/apple-icon-180x180.png": "ae5433149099ce818bc377f771625a0a",
"icons/apple-icon-72x72.png": "364456feb5b72a65cc0577a19a55e393",
"icons/apple-icon-152x152.png": "f3041f0292e3bce63dd332bdb053e9ba",
"icons/apple-icon-57x57.png": "aa61ee8bf6cad42066cfdf3604295f57",
"icons/apple-icon-76x76.png": "633eddc6e7c9349b27fa7e10eaa6776d",
"icons/favicon-96x96.png": "e13d4f717617d3b425be514b6337bd44",
"icons/apple-icon-114x114.png": "25d62b18e6821d62223e0a6dde9ac22b",
"manifest.json": "a8122b25a3d4d9a72ea5d0296b3825ae",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
