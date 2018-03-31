$(function() {
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  $('.sortable').sortable({
    opacity: 0.8,
    tolerance: 'pointer',
    handle: '.c-move',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  })
});

