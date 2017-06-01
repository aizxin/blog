<?php
namespace Sow\Validators;

use Phalcon\Validation;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\PresenceOf;

class AuthValidator extends Validation
{
    public function initialize()
    {
        $this->add(
            "name",
            new PresenceOf(
                [
                    "message" => $this->lang->_('validator.user.PresenceOf'),
                ]
            )
        );
        $this->add(
            "password",
            new PresenceOf(
                [
                    "message" => "The name is required",
                ]
            )
        );
        $this->add(
            "password",
             new StringLength(
                [
                    "max"            => 12,
                    "min"            => 6,
                    "messageMaximum" => "We don't like really long names",
                    "messageMinimum" => "We want more than just their initials",
                ]
            )
        );
    }
}