node('master') {

    stage('Inspect File') {
        // some block
    }
    stage('ProcessVHD') {
        // some block
    }
    stage('UploadVHD') {
        // some block
    }
  stage ('Stage Parallel')
  {
  def branches = [:]
  for (int i = 0; i < 3; i++) {
    branches["split${i}"] = {
      stage ('Stage parallel')
      {
      node('master') {
       echo  'Starting sleep'
       sleep 10
       echo  'Finished sleep'
      }
      }
    }
  }
  parallel branches
}
}
