import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';
import { getCoordinates, getRoute } from '$lib/graphhopper';

export const load = (async () => {
	await prisma.job.findMany(
		{
			where: { distance: null },
			include: { applicant: true },
		}
	).then((jobs) => jobs.forEach(async (job) => {
		if (!isNaN(Number(job.distance)) && Number(job.distance)) {
			console.log(`SKIP: job ${job.id} - ${job.location} - ${job.distance} km`);
			return;
		}
		console.log(`CALC: ${job.id} - ${job.location} - ${job.distance} km`);
		let route = await getRoute([
			await getCoordinates(job.applicant.location),
			await getCoordinates(job.location)
		]);
		await prisma.job.update({
			where: {
				id: job.id
			},
			data: {
				distance: route.kilometers,
				travelTime: route.minutes
			}
		});
	}));
	const users = await prisma.user.findMany();
	const jobs = await prisma.job.findMany({ include: { applicant: true } });

	return { jobs: jobs, users: users };
}) satisfies PageServerLoad;
