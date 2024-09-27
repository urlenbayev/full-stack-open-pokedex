import dotenv from 'dotenv'
import express from 'express'


dotenv.config()


const app = express()

// get the port from env variable
const PORT = process.env.PORT || 5000

app.use(express.static('dist'))


app.get('/health', (req, res) => {
  // eslint-disable-next-line no-constant-condition
  if (true) throw('error...  ')
  res.send('ok')
})


app.get('/version', (req, res) => {
  res.send('1.1')
})


app.listen(PORT, () => {
  console.log(`server started on port ${PORT}`)
})
