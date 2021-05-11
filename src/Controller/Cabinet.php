<?php namespace Src\Controller;

use Core\Service\Validator;
use Core\Service\Registry;
use Core\Service\Translation;
use Core\Facade\Template;

class Cabinet extends \Core\Middleware\Auth
{
    protected $prefix = 'cabinet';

    protected $login = 'email';

    protected $provider_type = 'Client';

    protected $session = 'cabinet';

    protected $login_template = 'cabinet/auth/login';

    protected $login_path = '/cabinet';

    protected $home_path = '/cabinet/profile';

    protected function bootDispatchTemplateDefaults()
    {
        (new Index)->bootDispatchTemplateDefaults();
    }

    protected function login()
    {
        $alert = null;

        if (!(new Validator\NotEmpty())->isValid(($login = Registry::get('http.request.body.'.$this->getLogin()))) || !(new Validator\NotEmpty())->isValid(($password = Registry::get('http.request.body.'.$this->getPassword())))) {
            $alert = '2';

        }else{

            if (!($user = $this->getProvider()->select([$this->getLogin().' = ?' => $login, $this->getPassword().' = ?' => sha1($password)])->first())) {
                    $alert = '4';
                }
        }

        if($alert) {
            Registry::set('session.alert', Translation::of('Email or password is incorrect'));
            Registry::set('session.old.'.$this->getLogin(), $login);
            return $this->redirect($this->getLoginPath());
        }
        $this->authUser($user);
        return $this->redirect($this->getHomePath());
    }

    protected function loginPage()
    {
        if (!($template = $this->getLoginPageTemplate())) {
            throw new \Exception("Set login_template property");
        }

        return $this->html(Template::render($template, [
            'alert' => Registry::pull('session.alert'),
            'old'   => Registry::pull('session.old'),
            'breadcrumbs'=>[''=>Translation::of('Login for tenants')]
        ]));
    }
}
