<?php namespace Core\Service\Validator;

class NotEmpty extends Rule
{
    public function isValid($value)
    {
        $value = trim($value);
        if (isset($value)) {
            if (is_string($value)) {
                return strlen($value);
            } else if (is_array($value)) {
                return !empty($value);
            } else {
                return true;
            }
        }

        return false;
    }
}