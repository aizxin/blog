<?php
namespace Sow\Validations;

use Sow\Validations\SowValidation;

use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;

class PermissionValidation extends SowValidation
{
    public function initialize()
    {
        $this->add(
             [
                "parent_id",
                "name",
                "slug",
            ],
            new PresenceOf(
                [
                    "message" => [
                        'parent_id' => $this->lang->t('permission.parent_id').$this->lang->t('validator.PresenceOf'),
                        'name' => $this->lang->t('permission.name').$this->lang->t('validator.PresenceOf'),
                        'slug' => $this->lang->t('permission.slug').$this->lang->t('validator.PresenceOf')
                    ]
                ]
            )
        );
        $this->add(
            "name",
             new Uniqueness(
                [
                    "model"   => new \Sow\Models\Permission(),
                    "message" => $this->lang->t('permission.name').$this->lang->t('validator.Uniqueness'),
                ]
            )
        );
    }
}