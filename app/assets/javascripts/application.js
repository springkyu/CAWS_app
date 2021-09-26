// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// topページスライドショー
  // topページ開いてから動かす

$(document).on('turbolinks:load',function(){
	if($('.slider').length < 1){ // 条件分岐
	    return
	}
    $('.slider').slick({
		autoplay: true, // 自動的に動く
		infinite: true, // スライドをループ
		speed: 1000, // スライドスピード
		slidesToShow: 3, // 画面に3枚
		slidesToScroll: 1, // 1回スクロールで1枚の写真
		prevArrow: '<div class="slick-prev"></div>', // 矢印部分PreviewのHTMLを変更
		nextArrow: '<div class="slick-next"></div>', // 矢印部分NextのHTMLを変更
		centerMode: true, // 要素の中央ぞろえ
		variableWidth: true, // 画像の高さを揃える
		dots: true, // ドットナビゲーション
	});
});
