



var original = {
    phone: 551,
    tablet: 1024,
    desktop: 3000
};

function getScale()
{
    var vh = window["innerHeight"] * .01;
    var width = $(window).width();
    var scale = {
        phone: width * 19 / original["phone"],
        tablet: width * 23 / original["tablet"],
        desktop: width * 25 / original["desktop"]
    };
    if (width < original["phone"])
    {
        document["documentElement"]["style"].setProperty("font-size", scale["phone"] + "px");
        document["documentElement"]["style"].setProperty("--vh", vh + "px");
    }else
    if (width < original["tablet"])
    {
        document["documentElement"]["style"].setProperty("font-size", scale["tablet"] + "px");
        document["documentElement"]["style"].setProperty("--vh", vh + "px");
    }
    else
    {
        document["documentElement"]["style"].removeProperty("--vh");
        // document["documentElement"]["style"].removeProperty("font-size");
        if (width > 1024 && width <= original["desktop"])
        {
            document["documentElement"]["style"].setProperty("font-size", scale["desktop"] + "px");
        }
        else
        {
            document["documentElement"]["style"].removeProperty("font-size");
        }
    }
};
window.onresize = function(event)
{
    getScale();
};
getScale();




$(function(){

    $('.tab_link').click(function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        $('.tab_link, .card_body').removeClass('active');
        $(this).addClass('active');
        $('.card_body[data-id="'+id+'"]').addClass('active');
    })

    $('.cat_link').click(function (e) {
        e.preventDefault();
        if($(this).hasClass('active')){
            $('.cat_link').removeClass('active');
            $('.cat_filters').slideUp();
        }else{
            $('.cat_filters').slideUp();
            $('.cat_link').removeClass('active');
            $(this).addClass('active');
            $(this).siblings('.cat_filters').slideDown();
        }
    });

    $('.active_sort').click(function (e) {
        e.preventDefault();
        $('.sort_drop').slideToggle();
        $(this).toggleClass('active');
    });

    $('.sort_drop a').click(function (e) {
        e.preventDefault();
        $('.sort_drop a, .active_sort').removeClass('active');
        $(this).addClass('active');
        $('.sort_drop').slideUp();

        var text = $(this).text();
        $('.active_sort span').text(text)

        var val = $(this).data('val');
        $('#sort_input').val(val);
    })

    $('.search_btn, .search--show').click(function (e) {
        e.preventDefault();
        $('.search').fadeIn();
    })
    $('.search_close').click(function (e) {
        e.preventDefault();
        $('.search').fadeOut();
    })
    $('.phone--show').click(function (e) {
        e.preventDefault();

        $('.menu').hide();
        $('.menu--show').removeClass('active');

        $(this).toggleClass('active');
        $('.phones').slideToggle();
    });

    $('.menu--show').click(function (e) {
        e.preventDefault();

        $('.phones').hide();
        $('.phone--show').removeClass('active');

        $(this).toggleClass('active');
        $('.menu').slideToggle();

    });


    $('.arr').click(function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
        $('.phones').slideToggle();
    });

    if ($('body').outerHeight() < $(window).height()) {
        $('footer').addClass('fixed');
        $('body').css('overflow-y', "visible");
    }


    var width = $(window).width();

    if(width > 1024){
        var headerHeight = $("header").outerHeight();
        if ($(window).scrollTop() >= headerHeight) {
            $('header').addClass('shadow');
        }
        $(window).scroll(function(){
            if ($(window).scrollTop() >= headerHeight) {
                $('header').addClass('shadow');
                $('.header_conter').slideUp();
            }
            else {
                $('header').removeClass('shadow');
                $('.header_conter').slideDown();
            }

        });
    }else{
        $('.filter_toggle').click(function (e) {
            e.preventDefault();
            $(this).toggleClass('active');
            $('.cat_nav').slideToggle();
        })
    }

    $('.i-sl').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        arrows: true,
        autoplay:true,
        speed: 1500,
        autoplaySpeed: 3000
    });

    $('.i-sl').on('init', function(event, slick){
        $('.slide_anim').addClass('animated fadeInLeft');
        setTimeout(function () {
            $('.slide_anim2').addClass('animated fadeInLeft');
        }, 500);
    });
    $('.i-sl').on('afterChange', function(event, slick, currentSlide, nextSlide){
        $('.slide_anim').addClass('animated fadeInLeft');
        setTimeout(function () {
            $('.slide_anim2').addClass('animated fadeInLeft');
        }, 500);
    });

    $('.i-sl').on('beforeChange', function(event, { slideCount: count }, currentSlide, nextSlide){

        $('.slide_anim, .slide_anim2').removeClass('animated fadeInLeft');

    })


    $('.cat--unit__for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.cat--unit__nav'
    });
    $('.cat--unit__nav').slick({
        autoplay: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.cat--unit__for',
        dots: false,
        arrows: true,
        focusOnSelect: true,
        responsive: [
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 3
                }
            }
        ]
    });



    $('.prod_slider').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false,
        arrows: true,
        autoplay:true,
        // speed: 1500,
        // autoplaySpeed: 3000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 550,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });

    $('.open--modal').on('click', function(){
        $('.modal').hide();
        var modal = $(this).attr('data-modal');
        $(modal).fadeIn();
        return false;
    });
    $('.modal .close, .modal__layer').on('click', function(){
        $(this).parents('.modal').fadeOut();
        return false;
    });

    
    $('.tel').inputmask({
        mask: '+7 (999) 999-99-99',
        placeholder: '+7 (___) ___-__-__',
        showMaskOnHover: false
    });
    wow = new WOW({
        boxClass:     'wow',
        animateClass: 'animated',
        offset:       100,
        mobile:       false,
        live:         true,
        duration: '1s'
    })
    wow.init();

    $('body').removeClass('load');
    setTimeout(function () {
        $('.loader').fadeOut();
        setTimeout(function () {
            $('.slide_anim').addClass('animated fadeInLeft');
            setTimeout(function () {
                $('.slide_anim2').addClass('animated fadeInLeft');
            }, 500);
        }, 500)
    }, 800);

    // получаем данные с формы, валидируем и отправляем на бэк #Zhandos-prog#
    $('#send-message').click(function () {
        let formData = {};
        // можно вынести в отдельную функцию
        $('.contacts_form').find('input, textarea').each(function () {
            formData[this.name] = $(this).val();
        })
        // console.log( formData)
        if(formData.name.trim() == '' || formData.phone == '' || formData.email.trim() == '') {
            alert('Заполните обязательное поля!')
            return false;
        }

        if( !validateEmail(formData.email)) {alert('Некорректный email!'); return false}
        $.ajax({
            url: '/ru/contact/send-data',
            method: 'post',
            data: {formData},
            success: function(data){
                if(data) {
                    $('#modal-success-msg').show()
                        // повторается
                    $('.contacts_form').find('input, textarea').each(function () {
                        formData[this.name] = $(this).val('');
                    })
                }else {
                    alert('Что-то пошло не так! Попробуйте еще раз!')
                }
            },
            error: function (status, statusText) {
                console.log(status, statusText)
            }
        });
    })

    // проверяем правильность email #Zhandos-prog#
    function validateEmail($email) {
        let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test( $email );
    }
});

