window.titoWidgetCallback = function(){
  TitoWidget.build_widgets = false;
  var tempButton = document.getElementById('tito-loading-button');
  var realButton = document.getElementById('tito-primary-button');

  setTimeout(function() {
    TitoWidget.buildWidgets();
    tempButton.classList.add('hidden');
    realButton.classList.remove('hidden');
  }, 1);
}
