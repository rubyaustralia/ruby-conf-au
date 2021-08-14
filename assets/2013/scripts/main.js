import $ from 'jquery';
import { Spinner } from 'spin.js';

class Form {
  constructor() {
    this.el = $('form');
    this.open = true;
    this.inputEl = this.el.find('input').first();
    this.buttonEl = this.el.find('a.button');
    this.successEl = this.el.find('.success');
    this.errorEl = this.el.find('.error');
    this.spinner = null;
    this.initHandlers();
  }

  email() {
    $.trim(this.inputEl.val());
  }

  isEmailValid() {
    return this.email().match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i) != null;
  }

  startSpinner() {
    var progressEl = this.el.find('.progress');
    var opts = {length: 6, width: 3, radius: 8};
    this.spinner = new Spinner(opts).spin();
    progressEl.append(this.spinner.el);
  }

  initHandlers() {
    this.el.on("submit", this.handleSubmission.bind(this));
    this.buttonEl.on("click", this.handleSubmission.bind(this));
  }

  handleSubmission() {
    if (!this.open) {
      return false;
    }

    if (this.isEmailValid()) {
      this.inputEl.attr('readonly', 'readonly').blur();
      this.errorEl.hide();
      this._startSpinner();
      $.ajax({
        type: "POST",
        url: "/subscribe",
        data: {'email': this.email()},
        success: this.onSuccess.bind(this),
      });
    } else {
      this.errorEl.show()
    }

    return false;
  }

  onSuccess() {
    this.spinner.stop();
    this.successEl.show();
    this.open = false;
  }
}

new Form();
