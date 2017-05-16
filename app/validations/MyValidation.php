<?php
namespace Sow\Validations;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;

class MyValidation extends Validation
{
    public function initialize()
    {
        $this->add(
            "name",
            new PresenceOf(
                [
                    "message" => "The name is required",
                ]
            )
        );

        $this->add(
            "email",
            new PresenceOf(
                [
                    "message" => "The e-mail is required",
                ]
            )
        );

        $this->add(
            "email",
            new Email(
                [
                    "message" => "The e-mail is not valid",
                ]
            )
        );
    }
}