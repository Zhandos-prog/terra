<?
namespace Core\Service;

use Core\Service\Phpmailer\Src\PHPMailer;
use Core\Service\Phpmailer\Src\Exception;

class Mailer {

	private $smail;

	public function __construct() {
		$smail = new PHPMailer;
        $smail->CharSet = "UTF-8";
        $smail->setFrom('alekocompany@yandex.kz', 'alekocompany@yandex.kz');
        $smail->From = 'alekocompany@yandex.kz';
        $smail->FromName = 'aleko.kz';
        $smail->IsHTML(true);
        $this->smail = $smail;
        $this->IsSMTP();
	}

	public function IsSMTP() {
		$this->smail->IsSMTP();
			
		/*$this->smail->SMTPOptions = array(
		    'ssl' => array(
		        'verify_peer' => false,
		        'verify_peer_name' => false,
		        'allow_self_signed' => true
		    )
		);*/

		$this->smail->Host = 'smtp.yandex.ru';
		$this->smail->Port = 465;
		$this->smail->SMTPAuth = true;
		//$this->smail->SMTPDebug = 2;

		$this->smail->Username = 'alekocompany@yandex.kz';
		$this->smail->Password = 'cRVU4dGz';

		$this->smail->SMTPSecure = 'ssl'; 
	}
	
	public function addFile() {
		if(isset($_FILES['files']) && count($_FILES['files'])) {
			foreach($_FILES['files']['name'] as $i=>$file) {
				var_dump($_FILES['files']['tmp_name'][$i]);
				$this->smail->addAttachment($_FILES['files']['tmp_name'][$i], $_FILES['files']['name'][$i]);    // Optional name	 
			}
		}
		if(isset($_FILES['file']) && count($_FILES['file'])) {
			//foreach($_FILES['file'] as $i=>$file) {
				//var_dump($_FILES[$i]['tmp_name']);
				$this->smail->addAttachment($_FILES['file']['tmp_name'], $_FILES['file']['name']);    // Optional name	 
			//}
		}
	}
	
	public function ClearAllRecipients() {
		$this->smail->ClearAllRecipients();
	}
	
	public function setSubject($subject) {
		$this->smail->Subject = $subject;
	}
	
	public function setBody($html) {
		$this->smail->Body  = $html;
	}
	
	public function send($emails) {
        $emails = explode(',', $emails);
        foreach($emails as $item){
            $this->smail->AddAddress($item);
        }
        $this->smail->Send();
        return true;
	}
}
	
	
			

			

			

			

			
?>