import { Alert, Card, Container, Navbar } from 'react-bootstrap'
import { LinkContainer } from 'react-router-bootstrap'
import { useRouteError } from 'react-router-dom'

const RootBoundary = () => {
  const error = useRouteError()

  return (
    <>
      <Navbar bg='dark' variant='dark' expand='lg' collapseOnSelect>
        <Container>
          <LinkContainer to='/'>
            <Navbar.Brand>MERN Auth</Navbar.Brand>
          </LinkContainer>
        </Container>
      </Navbar>
      <div className='py-5'>
        <Container className='d-flex justify-content-center'>
          <Card className='p-5 d-flex flex-column align-items-center hero-card bg-light w-75'>
            <h1 className='text-center mb-4'>{error.status}</h1>
            <h2 className='text-center mb-4'>{error.statusText}</h2>
            <Alert variant='danger' className='mb-4'>
              {import.meta.env.VITE_ENV !== 'production' ? error.error.stack : error.error.message}
            </Alert>
          </Card>
        </Container>
      </div>
    </>
  )
}
export default RootBoundary
