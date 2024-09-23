import { URLSearchParams } from "url"

export async function getCoordinates(address: string) {
	const OSM_URL = `https://nominatim.openstreetmap.org/search.php?q=${encodeURIComponent(address)}&format=jsonv2`
	// @ts-ignore
	let response: {"lat": number, "lon": number} =
		await fetch(OSM_URL).then((response) => {
			return response.json()
		}).then((data: Array<Object>) => {
			return data[0] //=
		}).catch((err) => {
			console.log('Fetch Error :-S', err)
		})
	return {
		lat: Number(response.lat),
		lon: Number(response.lon),
		hint: address.split(',')[0].split(' ').slice(0, -1).join(' ')
	}
}

export async function getRoute(coordinates: {lat: number, lon: number, hint: string}[]) {
	if (typeof process.env.GHOP_API_KEY == "undefined") {
		throw "Define your GraphHopper API key in your '.env' file"
	}
	const PARAMS = new URLSearchParams({key: process.env.GHOP_API_KEY!}).toString()
	const GRAPHHOPPER_URL = `https://graphhopper.com/api/1/route?${PARAMS}`
	let points: number[][] = []
	let hints: string[] = []
	coordinates.forEach(c => {
		points.push([c.lon, c.lat])
		hints.push(c.hint)
	})
	let body = {
		points: points,
		point_hints: hints,
		profile: "car",
		details: ["time"],
		calc_points: false
	}
	// @ts-ignore
	let response: {"paths": [{"distance": number, "time": number}]} =
		await fetch(GRAPHHOPPER_URL, {
			method: "POST",
			headers: {'Content-Type': 'application/json'},
			body: JSON.stringify(body),
		}).then((response) => {
			return response.json()
		}).then((data: Object) => {
			// console.log(JSON.stringify(data))
			return data
		}).catch((err) => {
			console.log('Fetch Error :-S', err)
		})
	return {
		kilometers: Number((response.paths[0].distance / 1000).toFixed(0)),
		minutes: Number((response.paths[0].time / 1000 / 60).toFixed(0)),
	}
}
