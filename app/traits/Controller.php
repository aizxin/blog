<?php
namespace Sow\Traits;

trait Controller
{
    /**
     *  [securityCSRF 防止CSRF攻击]
     *  @author Sow
     *  @DateTime 2017-06-08T19:23:38+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function securityCSRF($request)
    {
        $tokenKeySessionID = '$PHALCON/CSRF/KEY$';

        $tokenValueSessionID = '$PHALCON/CSRF$';
        if(!$this->session->has($tokenKeySessionID)){
            return false;
        }
        $tokenKey = $this->session->get($tokenKeySessionID);
        $knownToken = $this->session->get($tokenValueSessionID);
        $equals = hash_equals($knownToken, $request->$tokenKey);
        return $equals;
    }
    /**
     *  [apiError api错误返回]
     *  @author Sow
     *  @DateTime 2017-06-03T00:21:16+0800
     */
    public function jsonError($msg = '')
    {
        $result = [
            'code' => 400,
            'message' => $msg
        ];
        return $this->response->setJsonContent($result);
    }
    /**
     *  [jsonSuccess api成功返回]
     *  @author Sow
     *  @DateTime 2017-06-03T00:19:56+0800
     */
    public function jsonSuccess($data = [],$msg = '')
    {
        $result = [
            'code' => 200,
            'result' => $data,
            'message' => $msg
        ];
        return $this->response->setJsonContent($result);
    }
}