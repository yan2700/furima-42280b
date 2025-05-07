const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  const payjp = Payjp(gon.public_key);
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const cvcElement = elements.create("cardCvc");
  const expiryElement = elements.create("cardExpiry");

  numberElement.mount("#number-form");
  cvcElement.mount("#cvc-form");
  expiryElement.mount("#expiry-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const oldError = document.getElementById("card-error-message");
    if (oldError) oldError.remove();

    payjp.createToken(numberElement).then((response) => {
      let tokenInput;
      if (response.error) {
        // 空のトークンを送信してバリデーションを通す（alertは出さない）
        tokenInput = `<input value="" type="hidden" name="token">`;
      } else {
        // 通常のトークンを埋め込む
        tokenInput = `<input value="${response.id}" type="hidden" name="token">`;
      }
      form.insertAdjacentHTML("beforeend", tokenInput);
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
   