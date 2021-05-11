<?php namespace Src\Controller;

use Core\Facade\Template;
use Core\Gateway\Subjects;
use Core\Service\Mail;
use Zend\Db\Sql\Select;
use Core\Service\Registry;
use Src\Model\Subscriber;
use Src\Model\Boutique;


class Index extends AbstractController
{
    protected function bootRouting()
    {
        $this->GET('/', 'indexPage');
        $this->GET('/about', 'aboutPage');
        $this->GET('/contacts', 'contactsPage');
        $this->GET('/test', 'test');
    }

    public function test() {
        $cat = Subjects::of('Category')->find(2);
        var_dump($cat->parent->id);
        return $this->html('sdfsdf');
    }

    public function aboutPage() {
        $breadcrumbs = 'О компании';
        $page = Subjects::of('About')->find(1);
        return $this->html(Template::render(    'src/about/index', ['breadcrumbs'=>$breadcrumbs,'page'=>$page]));
    }

    public function contactsPage() {
        $breadcrumbs = 'Контакты';
        return $this->html(Template::render('src/contacts/index', ['breadcrumbs'=>$breadcrumbs]));
    }
  
    public function indexPage()
    {
        $slider = Subjects::of('Slider')->get();
        $products=Subjects::of('Product')->get();
        $about = Subjects::of('About')->find(1);
        $news = Subjects::of('News')->select(function ($select) {
            $select->limit(3)->order('date DESC');
        })->get();
        return $this->html(Template::render('src/index/index',
            [
                'sliders'=>$slider,
                'products'=>$products,
                'about'=>$about,
                'news'=>$news
            ]));
    }

}
