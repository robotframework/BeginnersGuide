var getNotebookBaseUrl = function() {
  try { return document.cookie.split("notebook=")[1].split(";")[0]; }
  catch(e) { return null; }
};

var setNotebookBaseUrl = function(url) {
  url = url.split("/notebooks/")[0];
  if (!url.match(/\/tree$/)) { url += "/tree"; }
  document.cookie = "notebook=" + url + ";max-age=300";
  if (typeof console !== "undefined" && console.log) {
    console.log("Hearbeat from " + url);
  }
  return url;
};

var createIframe = function(url) {
  var iframe = document.createElement("iframe");
  iframe.setAttribute("width", "100%");
  iframe.setAttribute("frameBorder", "0");
  iframe.setAttribute("src", url);
  iFrameResize({
    checkOrigin: false,
    log: false,
    messageCallback: function(message) {
      setNotebookBaseUrl(message.message.window.location.href);
    }
  }, iframe);
  return iframe;
};

var createButton = function(url) {
  var button = document.createElement("button");
  button.innerHTML = "Try this example in browser";
  button.addEventListener("click", function() {
      button.parentElement.appendChild(createIframe(url));
      button.parentElement.removeChild(button);
  });
  return button;
};

var initNotebookBaseUrl = function(callback) {
  var iframe = document.createElement("iframe");
  iframe.setAttribute("frameBorder", "nb-init");
  iframe.setAttribute("frameBorder", "0");
  iframe.setAttribute("height", "0");
  iframe.setAttribute("width", "0");
  iframe.setAttribute("src",
    "https://mybinder.org/v2/gh/robots-from-jupyter/BeginnersGuide/add-binder"
  );
  iFrameResize({
    checkOrigin: false,
    log: false,
    messageCallback: function(message) {
      if (callback !== null) {
        callback(setNotebookBaseUrl(message.message.window.location.href));
        callback = null;
      } else {
        setNotebookBaseUrl(message.message.window.location.href);
      }
    }
  }, iframe);
  document.body.appendChild(iframe);
};

var embedNotebooks = function(baseUrl) {
  var elements = document.getElementsByTagName("div"), i;
  for (i = 0; i < elements.length; i++) {
    if(elements[i].getAttribute("data-notebook")) {
      elements[i].appendChild(
        createButton(
          baseUrl + "/" + elements[i].getAttribute("data-notebook")
        )
      );
    }
  }
};

var init = function() {
  if (typeof iFrameResize === "undefined") {
    return setTimeout(init, 1000);
  } else {
    if (getNotebookBaseUrl()) {
      embedNotebooks(getNotebookBaseUrl());
    } else {
      initNotebookBaseUrl(embedNotebooks);
    }
  }
};

init();
