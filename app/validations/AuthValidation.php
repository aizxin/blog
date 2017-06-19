<?php
namespace Sow\Validations;

use Sow\Validations\SowValidation;

use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class AuthValidation extends SowValidation
{
    public function initialize()
    {
        $this->add(
            ["name","password"],
            new PresenceOf(
                [
                    "message" => [
                       "name" => $this->lang->t('user.name').$this->lang->t('validator.PresenceOf'),
                       "password" => $this->lang->t('user.password').$this->lang->t('validator.PresenceOf')
                    ]
                ]
            )
        );
        $this->add(
            "password",
             new StringLength(
                [
                    "max"            => 12,
                    "min"            => 6,
                    "messageMaximum" => $this->lang->t('user.password').$this->lang->t('validator.max'),
                    "messageMinimum" => $this->lang->t('user.password').$this->lang->t('validator.min')
                ]
            )
        );
    }
}