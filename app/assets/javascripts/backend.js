var Luncheon = Luncheon || {};

Luncheon.backend = function(url, type, data) {
  return $.ajax({
    url: url,
    dataType: 'json',
    type: type,
    data: data,
    success: function(data) {},
    error: function(xhr, status, err) {
      console.error(url, status, err.toString());
    }
  }).done(function(data) {});
};
