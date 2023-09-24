use admin

db.createUser({
  user: 'mernauthuser',
  pass: 'mernauthpass',
  roles: [
    { role: 'readWrite', db: 'mernauth' }
  ]
})