import dotenv from 'dotenv'
import express from 'express'


dotenv.config()


const app = express()

// get the port from env variable
const PORT = process.env.PORT || 5000

app.use(express.static('dist'))


app.get('/health', (req, res) => {
  res.send('ok')
})


app.get('/version', (req, res) => {
  res.send('0.0.2')
})


app.listen(PORT, () => {
  console.log(`server started on port ${PORT}`)
})
