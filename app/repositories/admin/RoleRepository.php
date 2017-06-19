<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\Role;
use Sow\Traits\Repository;

class RoleRepository extends AbstractRepository
{
    use Repository;
    final protected function __construct()
    {
        $this->model = Role::modelInit();
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
     *  [storeRole 角色添加/更新]
     *  @author Sow
     *  @DateTime 2017-06-18T13:32:08+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function storeRole($request)
    {
        $data = [
            'name'=>$request->name,
            'slug'=>$request->slug,
            'description'=>$request->description
        ];
        if (isset($request->id)){
            return $this->updateById($request->id,$data);
        }else{
            return $this->create($data);
        }
    }
    /**
     *  [destroyRole 角色删除]
     *  @author Sow
     *  @DateTime 2017-06-18T14:57:23+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function destroyRole($request)
    {
        $id = $request->id;
        if (is_array($id)) {
            return ($this->getIn('id',$id))->delete();
        } else {
            return $this->destroy($id);
        }
    }
    /**
     *  [getPermissions 角色权限]
     *  @author Sow
     *  @DateTime 2017-06-18T15:27:36+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPermissions($id)
    {
        $permissionIds = [];
        $role = $this->find($id);
        if(!$role)return $permissionIds;
        $permission = $role->getPermissions();
        if(!$permission)return $permissionIds;
        foreach ($permission as $kv) {
            $permissionIds[] = $kv->id;
        }
        return $permissionIds;
    }
    /**
     *  [addPermission 角色的权限添加/更新]
     *  @author Sow
     *  @DateTime 2017-06-18T22:14:44+0800
     *  @param    [type]                   $request [description]
     */
    public function addPermission($request,$data)
    {
        $role = $this->find($request->id);
        if(!$role)return false;
        return $role->permissions($request->permissionIds);
    }
}