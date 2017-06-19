<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\Permission;
use Sow\Traits\Repository;

class PermissionRepository extends AbstractRepository
{
    use Repository;
    final protected function __construct()
    {
        $this->model = Permission::modelInit();
    }
    /**
     *  [getPage 获取分页数据]
     *  @author Sow
     *  @DateTime 2017-06-04T17:21:56+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPage($request)
    {
        $map = [];
        if(!empty($request->name))
            $map['name'] = ['%'.$request->name.'%', 'LIKE'];
        return $this->getPaginate($map,$request);
    }
    /**
     *  [getParent 顶级权限]
     *  @author Sow
     *  @DateTime 2017-06-11T10:58:19+0800
     *  @return   [type]                   [description]
     */
    public function getMenu()
    {
        if(di('cache')->exists('permissionAll'))
            return di('cache')->get('permissionAll');
        $permission = sort_parent($this->all()->toArray());
        di('cache')->save('permissionAll',$permission);
        return $permission;

    }
    /**
     *  [storePermission 权限节点添加/更新]
     *  @author Sow
     *  @DateTime 2017-06-11T20:18:30+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function storePermission($request)
    {
        $data = [
            'parent_id'=>$request->parent_id,
            'ismenu'=>$request->ismenu,
            'name'=>$request->name,
            'slug'=>$request->slug,
            'description'=>$request->description,
            'icon'=>$request->icon,
            'issort'=>$request->issort,
        ];
        if (isset($request->id)){
            $isOk = $this->updateById($request->id,$data);
            if ($isOk)$this->getMenu();
            return $isOk;
        }else{
            $isOk = $this->create($data);
            if ($isOk)$this->getMenu();
            return $isOk;
        }
    }
    /**
     *  [destroyPermission 删除权限]
     *  @author Sow
     *  @DateTime 2017-06-12T22:22:30+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function destroyPermission($request)
    {
        $id = $request->id;
        if (is_array($id)) {
            $isOk = ($this->getIn('id',$id))->delete();
            if ($isOk)di('cache')->delete("permissionAll");$this->getMenu();
            return $isOk;
        } else {
            $isOk = $this->destroy($id);
            if ($isOk)di('cache')->delete("permissionAll");$this->getMenu();
            return $isOk;
        }
    }
    /**
     *  [findById getModelsManager 测试]
     *  @author Sow
     *  @DateTime 2017-06-08T21:17:00+0800
     *  @param    [type]                   $aid [description]
     *  @return   [type]                        [description]
     */
    public function findById($aid){
        $aid = intval($aid);
        if($aid <= 0){
            throw new \Exception('参数错误');
        }
        $phql = "SELECT * FROM \Sow\Models\Permission WHERE id = :aid: ";
        $result = $this->model->getModelsManager()->executeQuery($phql, array(
            'aid' => $aid
        ));
        return $result->toArray();
    }
}