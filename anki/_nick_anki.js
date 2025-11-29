// Can't use `const` here b/c this code is re-run on the back of the card, and
// using `const` would cause an already-defined error.
var vowelSounds = "aeiouhéàèùâêîôûëïü";

/**
 * Renders a definite article before some noun, based on the provided gender
 * & plurality. (automatically handles using "l’" before vowel sounds, for
 * example.)
 *
 *   <definiteArticle m>chien -> le chien
 *   <definiteArticle f>chienne -> la chienne
 *   <definiteArticle m>horloge -> l’horloge
 *   <definiteArticle m plural>chiens -> les chiens
 *
 * Some nouns can be both masculine and feminine (such as some professions). You
 * can use "mf" or "fm" as the gender.
 *
 *   <definiteArticle mf>docteur -> le/la docteur
 *   <definiteArticle mf plural>docteurs -> les docteurs
 *
 * Some words have no extra plural form because the word is already plural -
 * such as "les toilettes" for "bathroom with only toilets", ("la toilette"
 * means the toilet itself). However, they still have a gender -- so you can
 * use a double "mm" or "ff" for the gender.
 *
 *   <definiteArticle ff>toilettes -> les toilettes
 */
function definiteArticles() {
  Array.from(document.getElementsByTagName("definite")).forEach((definite) => {
    // skip if already starts with a definite article, so we can run this
    // idempotently
    if (
      definite.innerText.startsWith("le ") ||
      definite.innerText.startsWith("la ") ||
      definite.innerText.startsWith("les ") ||
      definite.innerText.startsWith("l’")
    ) {
      return;
    }

    if (
      definite.getAttribute("plural") === "" ||
      definite.getAttribute("ff") == "" ||
      definite.getAttribute("mm") == ""
    ) {
      definite.innerHTML = "les " + definite.innerHTML;
    } else if (vowelSounds.includes(definite.innerText[0]?.toLowerCase())) {
      definite.innerHTML = "l’" + definite.innerHTML;
    } else if (
      definite.getAttribute("mf") === "" ||
      definite.getAttribute("fm") === ""
    ) {
      definite.innerHTML = "le/la " + definite.innerHTML;
    } else if (definite.getAttribute("f") === "") {
      definite.innerHTML = "la " + definite.innerHTML;
    } else {
      definite.innerHTML = "le " + definite.innerHTML;
    }
  });
}

/**
 * For any <secret> tag, causes the secret to be revealed when its parent is
 * clicked. (The <secret> is initially hidden via CSS.)
 */
function secrets() {
  Array.from(document.getElementsByTagName("secret")).forEach((secret) => {
    ["mousedown", "touchstart"].forEach((eventType) =>
      secret.parentNode.addEventListener(eventType, (event) => {
        event.preventDefault();
        event.stopPropagation();
        secret.style.display = "block";
      })
    );
  });
}

/**
 * Organizes some <img> elements within an <imgs> tag so that CSS can make
 * them look like a nice group of images in a box.
 */
function imageBoxes() {
  Array.from(document.getElementsByTagName("imgs")).forEach((imageBox) => {
    Array.from(imageBox.getElementsByTagName("img")).forEach((image) => {
      const imageWrapper = document.createElement("div");
      imageWrapper.className = "image-box-image";
      imageBox.replaceChild(imageWrapper, image);
      imageWrapper.appendChild(image);
    });
  });
}

/**
 * "echos" some content vertically. The JS duplicates the content and the CSS
 * adds the "receding into the background" effect. Useful for hinting
 * plurality.
 */
function echos() {
  Array.from(document.getElementsByTagName("echo")).forEach((echo) => {
    echo.appendChild(echo.lastElementChild.cloneNode(true));
    echo.appendChild(echo.lastElementChild.cloneNode(true));
  });
}

/**
 * Adds "je" to the start of a <je> tag, or just "j'" if the first character
 * is a vowel sound.
 *
 *   <je>ai -> j’ai
 *   <je>suis -> je suis
 */
function je() {
  Array.from(document.getElementsByTagName("je")).forEach((je) => {
    // skip if already starts with je, so we can run this idempotently
    if (je.innerText.startsWith("je ") || je.innerText.startsWith("j’")) {
      return;
    }

    if (vowelSounds.includes(je.innerText[0]?.toLowerCase())) {
      je.innerHTML = "j’" + je.innerHTML;
    } else {
      je.innerHTML = "je " + je.innerHTML;
    }
  });
}

definiteArticles();
secrets();
imageBoxes();
echos();
je();
