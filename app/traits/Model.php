<?php
// +----------------------------------------------------------------------
// | Demo [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Date: 2017/1/27 Time: 上午8:35
// +----------------------------------------------------------------------
namespace Sow\Traits;

trait Model
{
    /**
     *  [$_mo 单例]
     *  @var null
     */
    private static $_mo = null;
    /**
     *  [modelsInit 单例的初始化]
     *  @author Sow
     *  @DateTime 2017-06-17T15:58:13+0800
     *  @return   [type]                   [description]
     */
    public static function modelInit(){
        if(self::$_mo === null){
            self::$_mo = new self();
        }
        return self::$_mo;
    }

    public function beforeCreate()
    {
        $this->created_at = date('Y-m-d H:i:s');
        $this->updated_at = date('Y-m-d H:i:s');
    }
    public function beforeUpdate()
    {
        $this->updated_at = date('Y-m-d H:i:s');
    }
}