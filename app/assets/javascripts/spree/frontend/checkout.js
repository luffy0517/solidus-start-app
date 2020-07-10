//= require_self
//= require spree/frontend/checkout/address
//= require spree/frontend/checkout/payment

Spree.disableSaveOnClick = () => {
  const form = document.querySelector('form.edit_order');
  form.addEventListener('submit', () => {
    const elements = form.querySelectorAll('[type="submit"], [type="image"]');
    elements.forEach(element => {
      element.setAttribute('disabled', true);
      element.classList.remove('primary');
      element.classList.add('disabled');
    });
  });
};

Spree.ready(() => {
  const termsCheckbox = document.getElementById('accept_terms_and_conditions');

  if (termsCheckbox) {
    termsCheckbox.addEventListener('change', () => {
      const submitButton = termsCheckbox.closest('form')
        .querySelector('[type="submit"]');

      if (termsCheckbox.checked) {
        submitButton.removeAttribute('disabled');
        submitButton.classList.remove('disabled');
      } else {
        submitButton.setAttribute('disabled', true);
        submitButton.classList.add('disabled');
      }
    });
  }
});
