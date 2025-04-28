window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })

  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  // 最初に販売利益を0に設定
  if (profit) {
    profit.textContent = 0;
  }

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);
      
      // 入力された金額が数字の場合
      if (!isNaN(price)) {
        // 販売手数料（10%）
        const tax = Math.floor(price * 0.1);

        // 利益（販売金額 - 販売手数料）
        const profitAmount = price - tax;

        // 手数料と利益を表示
        addTaxPrice.textContent = tax;  // 販売手数料（税額）を表示
        profit.textContent = profitAmount;  // 利益を表示
      } else {
        // 金額が入力されていない場合
        addTaxPrice.textContent = 0;
        profit.textContent = 0;
      }
    });
  }
});
