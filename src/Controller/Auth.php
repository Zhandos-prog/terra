<?php namespace Src\Controller;


use Core\Facade\Template;
use Core\Gateway\Subjects;
use Core\Service\Registry;
use Zend\Db\Sql\Select;
use Src\Controller\Cabinet;
use Core\Service\Translation;
use Core\Service\Locale;

class Auth extends AbstractController
{
    public function bootRouting()
    {
        $this->GET('/', 'loginPage');
        $this->POST('/', 'login');
    }

    public function loginPage() {
    	if($this->auth->check())
    		return $this->redirect('/'.Locale::getLocale().'/cabinet/');

    	$errors = Registry::pull('session.errors');
        return $this->html(Template::render('/cabinet/auth/login', ['errors'=>$errors]));
    }

    public function login() {

    	$result = $this->auth->login();

    	if($result !== 1) {
    		Registry::set('session.errors', Translation::of('Email or password is incorrect'));
    		return $this->redirect('/'.Locale::getLocale().'/auth');
    	}

    	return $this->redirect('/'.Locale::getLocale().'/cabinet/');
    }

    

}