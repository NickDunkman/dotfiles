// Can't use `const` here b/c this code is re-run on the back of the card, and
// using `const` would cause an already-defined error.
var vowelSounds = "aeiouhéàèùâêîôûëïüœ";

function deckTitles() {
  Array.from(document.getElementsByTagName("deck")).forEach((deck) => {
    if (!deck.querySelector("flag")) {
      const flag = deck.getAttribute("flag");
      if (flag) {
        deck.innerHTML = `<flag>${flag}</flag> ${deck.innerHTML} <flag>${flag}</flag>`;
      }
    }
  });
}

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
      }),
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
 * Conjugates a regular verb in the present tense.
 *
 *   <present subject="nous" verb="mange" /> -> mangeons
 *   <present subject="je" verb="finir" /> -> finis
 *   <present subject="ils" verb="vendre" /> -> vendent
 */
function presentVerbConjugation() {
  Array.from(document.getElementsByTagName("present")).forEach((present) => {
    const verb = present.getAttribute("verb").replace(/^se /, "");
    const reflexive = verb !== present.getAttribute("verb");
    const subject = present.getAttribute("subject");

    if (!verb || !subject) {
      return;
    }

    const ending = verb.slice(-2);

    let stem;
    if (
      (verb.endsWith("ayer") ||
        verb.endsWith("oyer") ||
        verb.endsWith("uyer")) &&
      subject !== "nous" &&
      subject !== "vous"
    ) {
      stem = verb.slice(0, -3) + "i"; // change y to i
    } else {
      stem = verb.slice(0, -2);
    }

    if (
      subject === "je" ||
      subject === "tu" ||
      subject === "il" ||
      subject === "elle" ||
      subject === "on"
    ) {
      if (
        [
          "appeler",
          "chanceler ",
          "épeler",
          "rappeler",
          "renouveler",
          "ruisseler",
          "feuilleter",
          "hoqueter",
          "jeter",
          "projeter",
          "rejeter",
        ].includes(verb)
      ) {
        stem += stem.slice(-1);
      } else if (stem.slice(-2, -1) === "e" || stem.slice(-2, -1) === "é") {
        stem = stem.slice(0, -2) + "è" + stem.slice(-1);
      }
    }

    let conjugation = "";
    if (ending === "er") {
      if (
        subject === "je" ||
        subject === "il" ||
        subject === "elle" ||
        subject === "on"
      ) {
        conjugation = `${stem}e`;
      } else if (subject === "tu") {
        conjugation = `${stem}es`;
      } else if (subject === "nous") {
        if (stem.endsWith("g")) {
          conjugation = `${stem}eons`;
        } else if (stem.endsWith("c")) {
          conjugation = `${stem.slice(0, -1)}çons`;
        } else {
          conjugation = `${stem}ons`;
        }
      } else if (subject === "vous") {
        conjugation = `${stem}ez`;
      } else if (subject === "ils" || subject === "elles") {
        conjugation = `${stem}ent`;
      }
    } else if (ending === "ir") {
      if (subject === "je" || subject === "tu") {
        conjugation = `${stem}is`;
      } else if (subject === "il" || subject === "elle" || subject === "on") {
        conjugation = `${stem}it`;
      } else if (subject === "nous") {
        conjugation = `${stem}issons`;
      } else if (subject === "vous") {
        conjugation = `${stem}issez`;
      } else if (subject === "ils" || subject === "elles") {
        conjugation = `${stem}issent`;
      }
    } else if (ending === "re") {
      if (subject === "je" || subject === "tu") {
        conjugation = `${stem}s`;
      } else if (subject === "il" || subject === "elle" || subject === "on") {
        conjugation = `${stem}`;
      } else if (subject === "nous") {
        conjugation = `${stem}ons`;
      } else if (subject === "vous") {
        conjugation = `${stem}ez`;
      } else if (subject === "ils" || subject === "elles") {
        conjugation = `${stem}ent`;
      }
    }

    if (reflexive) {
      const startsWithVowelSound = vowelSounds.includes(
        conjugation[0]?.toLowerCase(),
      );
      if (subject === "je") {
        conjugation = `${startsWithVowelSound ? "m’" : "me "} ${conjugation}`;
      } else if (subject === "tu") {
        conjugation = `${startsWithVowelSound ? "t’" : "te "} ${conjugation}`;
      } else if (
        subject === "il" ||
        subject === "elle" ||
        subject === "on" ||
        subject === "ils" ||
        subject === "elles"
      ) {
        conjugation = `${startsWithVowelSound ? "s’" : "se "} ${conjugation}`;
      } else if (subject === "nous") {
        conjugation = `nous ${conjugation}`;
      } else if (subject === "vous") {
        conjugation = `vous ${conjugation}`;
      }
    }

    present.innerHTML = conjugation;
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

deckTitles();
definiteArticles();
secrets();
imageBoxes();
echos();
presentVerbConjugation();
je();

// ***************************************************************************
// Utilities
// ***************************************************************************

function charIsEmoji(char) {
  // Regular emojis
  if (/\p{Emoji}/u.test(char)) {
    return true;
  }

  // Flags
  if (/[\uD83C][\uDDE6-\uDDFF][\uD83C][\uDDE6-\uDDFF]/u.test(char)) {
    return true;
  }

  return false;
}
