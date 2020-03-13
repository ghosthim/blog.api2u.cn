const fs = require('fs')
const path = require('path')
const util = require('util')
const OSS = require('ali-oss')
const promisifyReaddir = util.promisify(fs.readdir)
const promisifyStat = util.promisify(fs.stat)

const client = new OSS({
  region: 'oss-cn-hangzhou',
  //云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，部署在服务端使用RAM子账号或STS，部署在客户端使用STS。
  accessKeyId: '${UPTOC_UPLOADER_KEYID}',
  accessKeySecret: '${UPTOC_UPLOADER_KEYSECRET}',
  bucket: 'testwp1122'
})

// 上传的目录
const publicPath = path.resolve(__dirname, '.')

// 同步上传文件
async function put(proPath = '') {
  const dir = await promisifyReaddir(`${publicPath}${proPath}`)

  for (let i = 0; i < dir.length; i++) {
    const stat = await promisifyStat(path.resolve(`${publicPath}${proPath}`, dir[i]))

    if (stat.isFile()) {
      const fileStream = fs.createReadStream(path.resolve(`${publicPath}${proPath}`, dir[i]))
      console.log(`上传文件: ${proPath}/${dir[i]}`)
      const result = await client.putStream(`${proPath}/${dir[i]}`, fileStream)
      console.log(result)
    } else if (stat.isDirectory()) {
      // 递归子目录
      await put(`${proPath}/${dir[i]}`)
    }
  }
}

put()