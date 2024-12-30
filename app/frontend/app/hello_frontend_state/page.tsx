'use client'

import { useEffect, useState } from 'react'

export default function Page() {
    const [data, setData] = useState({name: '初期値'})

    useEffect(() => {
        const change = {name: '変更' }
        setData(change)
    }, []) // []を指定することで、初回レンダリン後に一回実行される

    return <div>hello {data.name}</div>
}