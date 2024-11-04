import React from 'react'
import Navigation from './components/navigation'

const App = () => {
  return (
    <div>
      <Navigation />
      <h1 className="text-3xl font-bold underline">
      Hello 
    </h1>
        <nav>
        <ul>
            <li>admin</li>
            <li>company</li>
            <li>invitations</li>
        </ul>
        </nav>
    </div>
  )
}

export default App