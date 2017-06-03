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
            "name",
            new PresenceOf(
                [
                    "message" => $this->lang->_('validator.user.PresenceOf')
                ]
            )
        );
        $this->add(
            "password",
            new PresenceOf(
                [
                    "message" => $this->lang->_('validator.password.PresenceOf')
                ]
            )
        );
        $this->add(
            "password",
             new StringLength(
                [
                    "max"            => 12,
                    "min"            => 6,
                    "messageMaximum" => $this->lang->_('validator.password.max'),
                    "messageMinimum" => $this->lang->_('validator.password.min')
                ]
            )
        );
    }
}