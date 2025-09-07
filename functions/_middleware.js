export async function onRequest(context) {
  // Handle API routes
  if (context.request.url.includes('/api/')) {
    return context.next();
  }
  
  // For all other routes, serve the index.html
  return new Response(null, {
    status: 302,
    headers: {
      'Location': '/'
    }
  });
}
