$(function() {

  $(".parent_info").on("click", function() {
    toggleChildren($(this).closest('.parent_wrapper'));
  });

});

function toggleChildren($parent_info) {
  var $child_wrapper = $parent_info.find(".child_wrapper");

  if ($child_wrapper.is(":hidden")) {
    $child_wrapper.slideDown(140, function() {
      $parent_info.find(".parent_info").addClass("active");
      $parent_info.find(".arrow i").removeClass("fa fa-arrow-circle-down").addClass("fa fa-arrow-circle-up");
    });
  }
  else {
    $child_wrapper.slideUp(120, function() {
      $parent_info.find(".parent_info").removeClass("active");
      $parent_info.find(".arrow i").removeClass("fa fa-arrow-circle-up").addClass("fa fa-arrow-circle-down");
    });
  }
}