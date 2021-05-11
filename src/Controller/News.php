<?php namespace Src\Controller;


use Core\Facade\Template;
use Core\Gateway\Subjects;
use Zend\Db\Sql\Select;

class News extends AbstractController
{
    public function bootRouting()
    {
        $this->GET('/', 'viewList');
        $this->GET('/{id:\d+}[-{name:[a-z\d\-]+}.html]', 'viewNewsItem');
    }

    public function viewList()
    {
        $breadcrumbs[''] = 'Новости';
        return $this->html(Template::render('src/news/list', [
            'newsList' => Subjects::of('News')->select(function (Select $select) {
                $select->order('date DESC');
            })->paginate(10),
            'breadcrumbs'=>$breadcrumbs
        ]));
    }


    public function viewNewsItem($id, $name = null)
    {
        if (!($newsItem = Subjects::of('News')->find($id))) {
            return $this->response(404);
        }
        $breadcrumbs['/ru/news/'] = 'Новости';
        $breadcrumbs[$newsItem->url()] = $newsItem->title;

        return $this->html(Template::render('src/news/item', [
            'newsItem' => $newsItem,
            'breadcrumbs'=>$breadcrumbs
        ]));
    }
}