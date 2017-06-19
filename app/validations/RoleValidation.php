<?php
namespace Sow\Validations;

use Sow\Validations\SowValidation;

use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;

class RoleValidation extends SowValidation
{
    public function initialize()
    {
        $this->add(
             [
                "name",
                "slug",
            ],
            new PresenceOf(
                [
                    "message" => [
                        'name' => $this->lang->t('role.name').$this->lang->t('validator.PresenceOf'),
                        'slug' => $this->lang->t('role.slug').$this->lang->t('validator.PresenceOf')
                    ]
                ]
            )
        );
        $this->add(
            "name",
             new Uniqueness(
                [
                    "model"   => new \Sow\Models\Role(),
                    "message" => $this->lang->t('role.name').$this->lang->t('validator.Uniqueness'),
                ]
            )
        );
    }
}