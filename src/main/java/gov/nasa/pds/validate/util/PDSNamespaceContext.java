// Copyright © 2019, California Institute of Technology ("Caltech").
// U.S. Government sponsorship acknowledged.
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// • Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
// • Redistributions must reproduce the above copyright notice, this list of
// conditions and the following disclaimer in the documentation and/or other
// materials provided with the distribution.
// • Neither the name of Caltech nor its operating division, the Jet Propulsion
// Laboratory, nor the names of its contributors may be used to endorse or
// promote products derived from this software without specific prior written
// permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

package gov.nasa.pds.validate.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.xml.namespace.NamespaceContext;

/**
 * Class that provides support for handling namespaces in PDS4 data products
 *
 * @author mcayanan
 *
 */
public class PDSNamespaceContext implements NamespaceContext {
  private Map<String, String> namespaces;
  private String defaultNamespace;

  public PDSNamespaceContext(Namespace namespace) {
    this(namespace, null);
  }

  public PDSNamespaceContext(Namespace namespace, String defaultNamespace) {
    List<Namespace> list = new ArrayList<>();
    list.add(namespace);
    new PDSNamespaceContext(list, defaultNamespace);
  }

  public PDSNamespaceContext(List<Namespace> namespaces) {
    this(namespaces, null);
  }

  public PDSNamespaceContext(String defaultNamespace) {
    this(new ArrayList<Namespace>(), defaultNamespace);
  }

  public PDSNamespaceContext(List<Namespace> namespaces, String defaultNamespace) {
    this.namespaces = new HashMap<>();
    for (Namespace ns : namespaces) {
      this.namespaces.put(ns.getPrefix(), ns.getUri());
    }
    this.defaultNamespace = defaultNamespace;
  }

  public String getDefaultNamepsace() {
    return defaultNamespace;
  }

  @Override
  public String getNamespaceURI(String prefix) {
    if (prefix == null || "".equals(prefix)) {
      return namespaces.get("pds");
    }
    return namespaces.get(prefix);
  }

  @Override
  public String getPrefix(String arg0) {
    // Method not necessary
    return null;
  }

  @Override
  public Iterator getPrefixes(String arg0) {
    // Method not necessary
    return null;
  }

}
