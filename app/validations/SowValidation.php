<?php
namespace Sow\Validations;

use Phalcon\Validation;

class SowValidation extends Validation
{
    protected $errors;
    /**
     *  [allMessage 返回所有错误]
     *  @author Sow
     *  @DateTime 2017-06-02T21:37:21+0800
     *  @param    [type]                   $errors [description]
     *  @return   [type]                           [description]
     */
    public function allMessage(){
        $errors = $this->errors;
        $data = [];
        foreach($errors as $error){
            $data[$error->getField()] = $error->getMessage();
        }
        return $data;
    }
    /**
     *  [firstMessage 返回第一个错误]
     *  @author Sow
     *  @DateTime 2017-06-02T21:38:08+0800
     *  @param    [type]                   $errors [description]
     *  @return   [type]                           [description]
     */
    public function firstMessage(){
        $errors = $this->errors;
        return $errors[0]->getMessage();
    }
    /**
     *  [validate 重新验证]
     *  @author Sow
     *  @DateTime 2017-06-02T22:34:43+0800
     *  @param    [type]                   $data [description]
     */
    public function validator($data)
    {
        $errors = $this->validate($data);
        if(count($errors)){
            // throw new \Phalcon\Validation\Exception($this->returnFirstError($errors));
            $this->errors = $errors;
            return false;
        }
        return true;
    }
}