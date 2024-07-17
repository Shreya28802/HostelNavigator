<script>
  // Add an event listener to the input fields
  const inputFields = document.querySelectorAll('.duration, .fees-per-month, .fees-paid');
  inputFields.forEach(inputField => {
    inputField.addEventListener('input', updateRemainingFees);
  });

  function updateRemainingFees() {
    const duration = parseFloat(document.querySelector('.duration').value);
    const feesPerMonth = parseFloat(document.querySelector('.fees-per-month').value);
    const feesPaid = parseFloat(document.querySelector('.fees-paid').value);

    if (!isNaN(duration) && !isNaN(feesPerMonth) && !isNaN(feesPaid)) {
      const remaningFees = (duration * feesPerMonth) - feesPaid;
      document.querySelector('.remaining-fees').textContent = remainingFees;
    }
  }
</script>
