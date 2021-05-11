<?php


namespace Src\Controller;

use Core\Facade\Template;
use Core\Gateway\Subjects;
use Core\Service\Mailer;
use Core\Service\Registry;

class Contact extends AbstractController
{
    private $data = [];

    protected function bootRouting()
    {
        $this->POST('/send-data', 'sendForm');
    }

    public function sendForm()
    {
        $request = Registry::get('http.request.body');
        $this->data = $request['formData'];
        $emails = Subjects::of('Variable')->find(1);
        $emails = explode(",", $emails->value);
        foreach($emails as $email) {
            $mailer = new Mailer;
            $mailer->setSubject('Сообщение с формы обратной связи');
            $mailer->setBody(Template::render('src/mail/request',['message'=>$this->data]));
            $mailer->send($email);
        }
        return $this->json(['success'=>true]);
    }
}