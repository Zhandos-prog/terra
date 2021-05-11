<?php namespace Src\Controller;

use Core\Facade\Template;
use Core\Gateway\Subjects;
use Core\Middleware\Controller;
use Core\Service\Locale;
use Core\Service\Registry;
use Illuminate\Support\Str;

abstract class AbstractController extends Controller
{
    protected $auth;
    protected $breadcrumbs = [];

    public function bootDispatchTemplateDefaults()
    {
        $contacts = Subjects::of('Contacts')->find(1);
        Template::defaults([
            'CMS' => new \Core\Service\CMS(),
            'Auth' => ($this->auth = new Cabinet),
            'social'=> $this->getSocial($contacts->social),
            'seo' => Subjects::of('Seo')->find(1),
            'locales' => $this->locales(),
            'lang'=>Locale::getLocale(),
            'logo'=> Subjects::of('Photo')->find(1),
            'contacts'=> $contacts,
            'breadcrumbs'=>$this->breadcrumbs,
            'header' => [
                'menu' => Subjects::of('Menu')->find(1),
                'phones' => $this->headerPhones($contacts->phones)
            ],
            'footer' => [
                'menu' => Subjects::of('Menu')->find(3),
                'data'=>Subjects::of('Variable')->select(['id'=>[2,3]])->get(),
                'categories'=>Subjects::of('Category')->get(),
            ]
        ]);
    }

    private function getSocial($socials)
    {
        $out = [];
        foreach ($socials as $social) {
            $out[] = '<a href="'.$social->url.'" target="_blank">
                        <i class="fa fa-'.$social->name.'"></i>
                    </a>';
        }
        return '
                <div class="social">
                    '.(join('',$out)).'
                </div>';
    }

    private function headerPhones($phones){
        if(!$phones){ return ''; }

        $active = '';
        $mobActive = '';
        $i = 0;
        $out=[];
        $phones = explode("\n", $phones);
        if(!empty($phones)){
            foreach ($phones as $phone){
                if($phone != ''){
                    $i++;
                    if($i == 1){
                        $active = '<a class="phone-link" href="tel:'.$phone.'">'.$phone.'</a>';
                        $mobActive = '<a class="mob_block" href="tel:'.$phone.'">'.$phone.'</a>';
                    }else{
                        $out[] = ' <a href="tel:'.$phone.'">'.$phone.'</a>';
                    }

                }
            }
        }
        return '<div class="phone-block">
                    <button class=" mob_block menu_toggle search--show">
                        <i class="fa fa-search"></i>
                        <i class="fa fa-times"></i>
                    </button>
                    <button class=" mob_block menu_toggle phone--show">
                        <i class="fa fa-phone"></i>
                        <i class="fa fa-times"></i>
                    </button>
                    <div class="phone-flex flex start wrap align-center mob_none">
                        '.$active.'
                        '.($i > 1 ? '<a href="#" class="arr"><i class="fa fa-chevron-down"></i></a>' : '').'
                    </div>
                    <div class="phones">
                        
                        <!-- mobile -->
                         '.$mobActive.'
                        <!-- //mobile -->
                        '.join('', $out).'
                    </div>
                </div>';
    }

    protected function locales()
    {
        $locales = [];
        foreach (Locale::getLocales() as $locale) {
            if ($locale == Locale::getLocale()) continue;
            $locales [Str::upper($locale)] = in_array(Registry::get('http.controller.path'), ['/'.Locale::getLocale()]) ? '/'.$locale : substr_replace(Registry::get('http.controller.path'), '/'.$locale, 0, 3).(Registry::get('http.request.path') != '/' ? Registry::get('http.request.path') : '');
        }
        $langs = ['RU'=>'Казахстан - Русский','EN'=>'Казахстан - Английский'];
        return Template::render('src/common/switch-locale', ['locales' => $locales, 'Str' => new Str, 'langs'=>$langs]);
    }
}