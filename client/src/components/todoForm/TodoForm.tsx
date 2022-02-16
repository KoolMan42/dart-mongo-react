import React, { useRef, MouseEvent } from 'react'
import Form  from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'


export default function TodoForm() {
  const todoName = useRef(null);
  const todoIsDone = useRef(null);

  const testLog = ()=>{
    console.log(`NAME = ${todoName.current} ISDONE = ${todoIsDone.current}`)
  }

  return (
    <React.Fragment>
      <Form>
        <Form.Group ref={todoName} className="mb-3" controlId="formBasicEmail">
          <Form.Label>Todo Name</Form.Label>
          <Form.Control  type="text" placeholder="Enter title of todo" />
          <Form.Text className="text-muted">
            Enter in a name for something that I am sure you will do later ;)
          </Form.Text>
        </Form.Group>


        <Form.Group ref={todoIsDone} className="mb-3" controlId="formBasicCheckbox">
          <Form.Check  type="checkbox" label="Is it already done?" />
        </Form.Group>


        <Button variant="primary" type="submit" onClick={(event: MouseEvent<HTMLButtonElement>)=>{
          event.preventDefault()
          testLog()
        }}>
    Submit
  </Button>

      </Form>
    </React.Fragment>
  )
}
