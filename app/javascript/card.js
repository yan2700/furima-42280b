const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // 公開鍵を設定
  const payjp = Payjp("pk_test_1382a67603c2f48849a659b3"); // ← 自分の公開鍵に置き換えてね
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const cvcElement = elements.create("cardCvc");
  const expiryElement = elements.create("cardExpiry");

  numberElement.mount("#number-form");
  cvcElement.mount("#cvc-form");
  expiryElement.mount("#expiry-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;
        const tokenObj = `<input value="${token}" type="hidden" name="token">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
        form.submit();
      }
    });
  });
};

window.addEventListener("turbo:load", pay);
