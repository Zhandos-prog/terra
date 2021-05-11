<?php namespace Src\Model;

use Core\Service\Locale;
use Core\Service\Translation;

class Product extends AbstractModel
{
	public function previewImage() {
		$imagePath = '/img/no-photo.jpg';

		if($image = $this->images()->first()) {
			$imagePath = $image->src;
		}
		return $imagePath;
	}	

    public function url()
    {
        return '/'.Locale::getLocale().'/catalog/product/'.$this->id.(($chpu = Translation::translit($this->name)) ? '-'.$chpu : '');
    }
}